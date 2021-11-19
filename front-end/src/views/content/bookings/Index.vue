<template>
  <div class="animated fadeIn">
    <b-row>
      <b-col>
        <bookings-table
          :fields="table_settings.fields"
          :api_url="table_settings.api_url"
          :delete_url="table_settings.delete_url"
          ref="displayTable"
        />
      </b-col>
    </b-row>
    <!-- Modal Component -->
    <b-modal header-text-variant="light"
             header-bg-variant="primary"
             v-model="booking_details_modal"
             size="xl"
             body-class="p-0"
             no-close-on-backdrop no-close-on-esc
             hide-footer>
      <template slot="modal-title">
        <div>
          <h5><i class='fa fa-fw fa-file-text'></i>BOOKING SUMMARY</h5>
        </div>
      </template>
      <b-row class="m-0" v-if="booking_id!=-1">
        <!-- COL - 1 -->
        <b-col md="3" class="mt-2 p-0">
          <b-row class="m-0">
            <b-col class="p-0">
              <div class="shadow ml-2 mb-2 bg-white">
                <b-row class="bg-success border border-secondary m-0">
                  <b-col class="p-2 text-center">
                    <strong>
                      TOTAL PAID
                    </strong>
                  </b-col>
                </b-row>
                <div class="bg-white py-2 text-center">
                  <h4 class="mb-0"><strong>{{booking_details.total_payment.other_formats.format_1}}</strong></h4>
                </div>
              </div>
            </b-col>
            <b-col class="p-0">
              <div class="shadow ml-2 mb-2 bg-white">
                <b-row class="bg-danger border border-secondary m-0">
                  <b-col class="p-2 text-center">
                    <strong>
                      BALANCE
                    </strong>
                  </b-col>
                </b-row>
                <div class="bg-white py-2 text-center">
                  <h4 class="mb-0"><strong>{{booking_details.booking_balance.other_formats.format_1}}</strong></h4>
                </div>
              </div>
            </b-col>
          </b-row>
          <div class="ml-2 bg-white">
            <b-row class="bg-primary border border-secondary m-0">
              <b-col class="p-2">
                <strong>
                  ITINERARY DETAILS
                </strong>
              </b-col>
            </b-row>
            <template>
              <div class="border border-secondary border-top-0 bg-white p-2">
                <b-list-group>
                  <b-list-group-item class="p-2">
                    <h6 class="text-primary mb-0">Itinerary Brand</h6>
                    <h3 class="mb-0 pb-0 font-weight-bold">
                      {{booking_details.itinerary_details.itinerary_brand.description}}
                      <span
                        class="text-muted d-block h6">{{booking_details.itinerary_details.itinerary_country.name}}</span>
                    </h3>
                  </b-list-group-item>
                  <b-list-group-item class="p-2">
                    <h6 class="text-primary mb-0">Boat Model</h6>
                    <h3 class="mb-0 pb-0 font-weight-bold">
                      {{booking_details.itinerary_details.itinerary_boat.boat_brand.name}}
                      <span class="text-muted d-block h6">{{booking_details.itinerary_details.itinerary_boat.boat_type.name}}</span>
                    </h3>
                  </b-list-group-item>
                  <b-list-group-item class="p-2">
                    <h6 class="text-primary mb-0">Check In</h6>
                    <h3 class="mb-0 pb-0 font-weight-bold">
                      {{booking_details.itinerary_details.itinerary_city_from.name}}
                      <span class="text-muted d-block h6">{{booking_details.itinerary_details.port_from.name}}</span>
                      <span
                        class="d-block h6">{{booking_details.itinerary_details.check_in.other_formats.format_2}}</span>
                    </h3>
                  </b-list-group-item>
                  <b-list-group-item class="p-2">
                    <h6 class="text-primary mb-0">Check Out</h6>
                    <h3 class="mb-0 pb-0 font-weight-bold">
                      {{booking_details.itinerary_details.itinerary_city_to.name}}
                      <span class="text-muted d-block h6">{{booking_details.itinerary_details.port_to.name}}</span>
                      <span
                        class="d-block h6">{{booking_details.itinerary_details.check_out.other_formats.format_2}}</span>
                    </h3>
                  </b-list-group-item>
                </b-list-group>
              </div>
            </template>
          </div>
          <div class="bg-light border border-secondary ml-2 mt-2">
            <b-row class="bg-primary m-0">
              <b-col class="p-2">
                <strong class="text-uppercase">
                  add ons
                </strong>
                <b-button size="sm" class="float-right text-white" variant="info" @click="updateGuestsCabin(2)"><i
                  class='fa fa-fw fa-pencil'></i> Manage Add Ons
                </b-button>
              </b-col>
            </b-row>
            <b-row class="m-0 px-2 py-2">
              <b-col v-for="add_on in booking_details.add_ons" md="12"
                     class="p-2 my-1 rounded border border-socondary bg-white">
                <b-row class="d-flex align-items-center">
                  <b-col md="7">
                    <h6 class="mb-0 pb-0 font-weight-bold text-uppercase">
                      ({{add_on.qty.toLocaleString('en-US',{ minimumFractionDigits: 2
                      })}}){{add_on.details.description}}
                    </h6>
                    <h6 class="mb-0">@ &euro;{{add_on.price.toLocaleString('en-US',{ minimumFractionDigits: 2 })}}
                      each</h6>
                  </b-col>
                  <b-col class="text-right">
                    <strong class="d-block text-muted">
                      TOTAL
                    </strong>
                    <span class="d-block h6">
                                    &euro;{{(add_on.price*add_on.qty).toLocaleString('en-US',{ minimumFractionDigits: 2 })}}
                                    </span>
                  </b-col>
                </b-row>
              </b-col>
            </b-row>
          </div>
        </b-col><!-- COL - 1 END-->

        <!-- COL - 2-->
        <b-col md="4" class="p-0">
          <div class="bg-light border border-secondary m-2">
            <b-row class="bg-primary m-0">
              <b-col class="p-2">
                <strong class="text-uppercase">
                  Guest Details
                </strong>
              </b-col>
            </b-row>
            <b-row class="m-0 px-2 py-2">
              <b-col v-for="(guest, index) in booking_details.guests" md="12"
                     class="p-2 my-1 rounded border border-socondary bg-white">
                <b-row class="m-0">
                  <b-col md="6" class="p-0 cursor-pointer" @click="updateGuest(guest)">
                    <h5 class="mb-0 pb-0 font-weight-bold text-uppercase text-primary"
                        :class="{ 'text-danger': guest.guest_details.last_name==''}">
                      {{(guest.guest_details.last_name!='') ? guest.guest_details.last_name : 'Guest ' + (index+1)}},
                    </h5>
                    <h6 class="text-uppercase mb-1 text-primary"
                        :class="{ 'text-danger': guest.guest_details.last_name==''}">
                      {{(guest.guest_details.first_name!='') ? guest.guest_details.first_name : 'Guest'}}</h6>
                  </b-col>
                  <b-col class="text-right p-0">
                    <a style="font-size:12px;" class="cursor-pointer text-uppercase text-primary"
                       @click="updateGuest(guest)">
                      Update Guest Profile
                      <i class='fa fa-fw fa-pencil cursor-pointer h5 text-primary'></i>
                    </a>
                    <!-- <strong class="d-block text-muted">
                    Cabin
                    </strong>
                    <span class="d-block h6 cursor-pointer" @click="updateGuestsCabin()">
                    {{guest.guest_cabin_details.cabin_description.cabin_type.name}} - {{guest.guest_cabin_details.cabin_description.code}} ({{guest.occupancy}})
                    </span>
                    <span class="d-block h6">
                    @ &euro;{{guest.total_amount_due.toLocaleString('en-US',{ minimumFractionDigits: 2 })}}
                    </span> -->
                  </b-col>
                </b-row>
                <b-row class="m-0 border-top">
                  <b-col md="12" class="p-0 pt-2">
                    <b-row class="m-0">
                      <b-col class="p-0">
                        <strong class="text-muted">Cabin</strong>
                        <p v-if="guest.guest_cabin_details !== null">{{guest.guest_cabin_details.cabin_description.cabin_type.name}} -
                          {{guest.guest_cabin_details.cabin_description.code}}</p>
                      </b-col>
                      <b-col class="p-0">
                        <strong class="text-muted">Occupancy</strong>
                        <p>{{guest.occupancy}}</p>
                      </b-col>
                    </b-row>
                    <b-row class="m-0">
                      <b-col class="p-0">
                        <strong
                          :class="{ 'text-danger':guest.guest_details.birth_date.default=='', 'text-muted':guest.guest_details.birth_date.default!=''}">Date
                          of Birth</strong>
                        <p>{{guest.guest_details.birth_date.default=='' ?
                          'none':guest.guest_details.birth_date.other_formats.format_1}}</p>
                      </b-col>
                      <b-col class="p-0">
                        <strong
                          :class="{ 'text-danger':guest.guest_details.birth_date.other_formats.format_2=='', 'text-muted':guest.guest_details.birth_date.other_formats.format_2!=''}">Age</strong>
                        <p>{{guest.guest_details.birth_date.other_formats.format_2==0 ?
                          'none':guest.guest_details.birth_date.other_formats.format_2}}</p>
                      </b-col>
                    </b-row>
                    <b-row class="m-0">
                      <b-col class="p-0">
                        <strong
                          :class="{ 'text-danger': guest.guest_details.email=='', 'text-muted':guest.guest_details.email!=''}">Email</strong>
                        <p>{{guest.guest_details.email=='' ? 'none':guest.guest_details.email}}</p>
                      </b-col>
                      <b-col class="p-0">
                        <strong
                          :class="{ 'text-danger': guest.guest_details.phone_number=='', 'text-muted':guest.guest_details.phone_number!=''}">Phone
                          Number</strong>
                        <p>{{guest.guest_details.phone_number=='' ? 'none':guest.guest_details.phone_number}}</p>
                      </b-col>
                    </b-row>
                    <b-row class="m-0">
                      <b-col class="p-0">
                        <strong
                          :class="{ 'text-danger': guest.guest_details.passport_number=='', 'text-muted':guest.guest_details.passport_number!=''}">Passport
                          Number</strong>
                        <p>{{guest.guest_details.passport_number=='' ? 'none':guest.guest_details.passport_number}}</p>
                      </b-col>
                      <b-col class="p-0">
                        <strong
                          :class="{ 'text-danger': guest.guest_details.expiration_date=='', 'text-muted':guest.guest_details.expiration_date!=''}">Expiration
                          Date</strong>
                        <p>{{guest.guest_details.expiration_date=='' ? 'none':guest.guest_details.expiration_date}}</p>
                      </b-col>
                    </b-row>
                    <b-row class="m-0">
                      <b-col class="p-0">
                        <strong
                          :class="{ 'text-danger': guest.guest_details.pob_country=='' || guest.guest_details.pob_city=='', 'text-muted':guest.guest_details.pob_country!='' && guest.guest_details.pob_city!=''}">Place
                          of Birth</strong>
                        <p>{{guest.guest_details.pob_country=='' ? 'none':guest.guest_details.pob_country}},
                          {{guest.guest_details.pob_city=='' ? 'none':guest.guest_details.pob_city}}</p>
                      </b-col>
                      <b-col class="p-0">
                        <strong
                          :class="{ 'text-danger': guest.guest_details.current_residency=='', 'text-muted':guest.guest_details.current_residency!=''}">Current
                          Residency</strong>
                        <p>{{guest.guest_details.current_residency=='' ?
                          'none':guest.guest_details.current_residency}}</p>
                      </b-col>
                    </b-row>
                    <b-row class="m-0">
                      <b-col class="p-0">
                        <strong
                          :class="{ 'text-danger': guest.guest_details.gender_id=='', 'text-muted':guest.guest_details.gender_id!=''}">Gender</strong>
                        <p>{{guest.guest_details.gender_id=='' ? 'none':guest.guest_details.gender.description}}</p>
                      </b-col>
                      <b-col class="p-0">
                        <strong
                          :class="{ 'text-danger': guest.guest_details.nationality_id=='', 'text-muted':guest.guest_details.nationality_id!=''}">Nationality</strong>
                        <p>{{guest.guest_details.nationality_id=='' ?
                          'none':guest.guest_details.nationality_details.description}}</p>
                      </b-col>
                    </b-row>
                    <b-row class="m-0">
                      <b-col class="p-0">
                        <strong
                          :class="{ 'text-danger': guest.guest_details.medical_issues=='', 'text-muted':guest.guest_details.medical_issues!=''}">Medical
                          Issues</strong>
                        <p>{{guest.guest_details.medical_issues=='' ? 'none':guest.guest_details.medical_issues}}</p>
                      </b-col>
                    </b-row>
                    <b-row class="m-0">
                      <b-col class="p-0">
                        <strong
                          :class="{ 'text-danger': guest.guest_details.allergies=='', 'text-muted':guest.guest_details.allergies!=''}">Allergies</strong>
                        <p>{{guest.guest_details.allergies=='' ? 'none':guest.guest_details.allergies}}</p>
                      </b-col>
                    </b-row>
                    <b-row class="m-0">
                      <b-col class="p-0">
                        <strong
                          :class="{ 'text-danger': guest.guest_details.diet_option_id=='', 'text-muted':guest.guest_details.diet_option_id!=''}">Diet</strong>
                        <p>{{guest.guest_details.diet_option_id=='' ?
                          'none':guest.guest_details.diet_option.description}}</p>
                      </b-col>
                    </b-row>
                    <b-row class="m-0">
                      <b-col class="p-0">
                        <strong
                          :class="{ 'text-danger': guest.guest_details.other_concerns=='', 'text-muted':guest.guest_details.other_concerns!=''}">Other Concerns</strong>
                        <p>{{guest.guest_details.other_concerns=='' ? 'none':guest.guest_details.other_concerns}}</p>
                      </b-col>
                    </b-row>
                  </b-col>
                </b-row>
              </b-col>
            </b-row>
          </div>
        </b-col><!-- COL - 2 END-->

        <!-- COL - 3-->
        <b-col class="p-0">
          <div class="bg-light border border-secondary my-2 mr-2 ml-0">
            <b-row class="bg-primary m-0">
              <b-col class="p-2">
                <strong class="text-uppercase">
                  Invoices
                </strong>
                <div class="text-right d-inline float-right">

                  <b-dropdown class="ml-2" size="sm">
                    <template v-slot:button-content>
                      <i class='fa fa-fw fa-navicon'></i> Actions
                    </template>
                    <template v-if="user_details.role.id!=4 && booking_details.booking_balance.default>0">
                      <b-dropdown-item @click="openPaymentModal()">
                        <i class='text-dark fa fa-fw fa-plus-circle'></i>Process Payment
                      </b-dropdown-item>
                      <b-dropdown-divider class="my-0"></b-dropdown-divider>
                    </template>

                    <template v-if="user_details.id==booking_details.user_id && booking_details.booking_balance.default>0">
                      <b-dropdown-item @click="openPaypalModal()">
                        <i class='text-dark fa fa-fw fa-plus-circle'></i>Process Payment
                      </b-dropdown-item>
                      <b-dropdown-divider class="my-0"></b-dropdown-divider>
                    </template>
                    <template  v-if="user_details.role.id==1">
                    <b-dropdown-item @click="emailReminder(0)"><i class='text-dark fa fa-fw fa-envelope'></i>Send Deposit Reminder
                    </b-dropdown-item>
                    <b-dropdown-item @click="emailReminder(1)"><i class='text-dark fa fa-fw fa-envelope'></i>Send Outstanding Balance Reminder
                    </b-dropdown-item>
                    <b-dropdown-item @click="emailReminder(2)"><i class='text-dark fa fa-fw fa-envelope'></i>Send Crew List Reminder
                    </b-dropdown-item>
                    <b-dropdown-item @click="emailDefaultCredentials()"><i class='text-dark fa fa-fw fa-envelope'></i>Send Account Credentials
                    </b-dropdown-item>
                      <b-dropdown-divider class="my-0"></b-dropdown-divider>
                    </template>

                    <b-dropdown-item @click="printItinerary()"><i class='text-dark fa fa-fw fa-print'></i>Print Trip Details
                    </b-dropdown-item>
                    <b-dropdown-item @click="printReceipt()"><i class='text-dark fa fa-fw fa-print'></i>Print Invoice
                    </b-dropdown-item>

                    <template  v-if="user_details.role.id==1">
                      <b-dropdown-divider class="my-0"></b-dropdown-divider>
                    <b-dropdown-item @click="cancelBooking()">
                      <i class='text-danger fa fa-fw fa-close'></i><span class="text-danger">Cancel Booking</span>
                    </b-dropdown-item>
                    </template>
                  </b-dropdown>

                  <!-- <b-button size="sm"
                            v-if="user_details.id==booking_details.user_id && booking_details.booking_balance.default>0"
                            variant="success" @click="openPaypalModal()"><i class='fa fa-fw fa-plus-circle'></i>Process
                    Payment
                  </b-button> -->
                 <!-- <b-button size="sm" class="ml-2" v-if="user_details.id==booking_details.user_id" variant="warning"
                           style="color:#fff;" @click="openRefundModal"><i class='fa fa-fw fa-minus-circle'></i>Request
                 </b-button>
                  <b-button size="sm" v-if="user_details.role.id!=4" variant="success" @click="openPaymentModal()"><i
                    class='fa fa-fw fa-plus-circle'></i>Process Payment
                  </b-button>
                  <b-dropdown split text="Trip Details" class="ml-2" size="sm">
                    <b-dropdown-item @click="printItinerary()"><i class='text-dark fa fa-fw fa-print'></i>Print Trip
                      Details
                    </b-dropdown-item>
                    <b-dropdown-item @click="emailItinerary()"><i class='text-dark fa fa-fw fa-envelope'></i> Email
                      Itinerary
                    </b-dropdown-item>
                  </b-dropdown>
                  <b-dropdown split text="Invoice" class="ml-2" size="sm">
                    <b-dropdown-item @click="printReceipt()"><i class='text-dark fa fa-fw fa-print'></i>Print Invoice
                    </b-dropdown-item>
                    <b-dropdown-item @click="emailInvoice()"><i class='text-dark fa fa-fw fa-envelope'></i> Email
                      Invoice
                    </b-dropdown-item>
                  </b-dropdown>
                  <b-button variant="danger" class="ml-2" size="sm" v-if="user_details.role.id==1" @click="cancelBooking()"><i
                    class='fa fa-fw fa-close'></i>Cancel Booking
                  </b-button>
                  <b-dropdown split text="Send Email" class="ml-2" size="sm">
                    <b-dropdown-item @click="emailReminder(0)"><i class='text-dark fa fa-fw fa-envelope'></i>Deposit Reminder
                    </b-dropdown-item>
                    <b-dropdown-item @click="emailReminder(1)"><i class='text-dark fa fa-fw fa-envelope'></i> Outstanding Balance Reminder
                    </b-dropdown-item>
                    <b-dropdown-item @click="emailReminder(2)"><i class='text-dark fa fa-fw fa-envelope'></i> Crew List Reminder
                    </b-dropdown-item>
                  </b-dropdown> -->
                </div>
              </b-col>
            </b-row>
            <b-row class="m-0 px-2 py-2">
              <b-list-group class="mt-1 w-100">
                <b-list-group-item class="active p-2">
                  Payments
                </b-list-group-item>
                <template v-for="invoice in invoices">
                  <b-list-group-item class="cursor-pointer p-2" v-for="(payment,index) in invoice.payments">
                    <b-row>
                      <b-col class="">
                        <h6 class="mb-0">{{payment.amount_paid.other_formats.format_1}}</h6>
                        <span class="small text-muted">{{payment.invoice_payment_number}} | {{payment.data_logs.create_details.date_time.other_formats.format_1}}</span>
                      </b-col>
                      <b-col class="text-right">
                        <h6 class="mb-0">{{payment.payment_type.description}}</h6>
                        <span class="small text-muted">{{payment.data_logs.create_details.user.full_name}}</span>
                      </b-col>
                    </b-row>
                  </b-list-group-item>
                </template>
              </b-list-group>
            </b-row>
          </div>
        </b-col><!-- COL - 3 END-->
      </b-row>
      <div v-else style="height:500px">
        <b-row align-v="center" class="modal-loader">
            <b-col>
                <b-spinner></b-spinner>
                <br><br>
                <strong>Loading</strong>
            </b-col>
        </b-row>
      </div>
    </b-modal>


    <!-- INVOICE PAYMENT MODAL -->
    <b-modal header-text-variant="light"
             header-bg-variant="primary"
             v-model="invoice_payment_modal"
             body-class="p-0"
             no-close-on-backdrop no-close-on-esc
             centered
             hide-footer>
      <template slot="modal-title">
        <h6 class="m-0"><i class='fa fa-fw fa-file-text'></i>PAYMENT FOR INVOICE
          <u>{{selected_invoice.invoice_number}}</u></h6>
      </template>
      <div v-if="invoice_payment_modal" class="p-3">
        <b-row class="m-0">
          <b-col md="4" class="p-0 pr-2">
            <!-- <Callout variant="info" class="bg-white p-1 m-0">
                <small class="text-muted">Payment Terms</small><br>
                <strong class="h6">{{invoice.payment_terms==1 ? 'FULLPAYMENT' : 'DEPOSIT'}}</strong>
            </Callout> -->
            <Callout variant="info" class="bg-white p-1 m-0 shadow">
              <small class="text-muted">Invoice Amount Due</small><br>
              <strong class="h6">{{selected_invoice.grand_total.other_formats.format_1}}</strong>
            </Callout>
          </b-col>
          <b-col md="4" class="p-0 pr-2">
            <Callout variant="warning" class="bg-white p-1 m-0 shadow">
              <small class="text-muted">Deposit Amount Due</small><br>
              <strong class="h6">{{selected_invoice.deposit_amount_due.other_formats.format_1}}</strong>
            </Callout>
          </b-col>
          <b-col md="4" class="p-0">
            <Callout variant="danger" class="bg-white p-1 m-0 shadow">
              <small class="text-muted">Invoice Balance</small><br>
              <strong class="h6">{{selected_invoice.invoice_balance.other_formats.format_1}}</strong>
            </Callout>
          </b-col>
        </b-row>
        <div class="form-group mt-3">
            <strong class="text-muted">Payment Type</strong>
            <select class="form-control mt-1" v-model="payment_type.value" v-bind:class="{ 'is-invalid': payment_type.error }">
                <option value="">Select</option>
                <option v-for="row in payment_types" :value="row.id">
                    {{row.description}}
                </option>
            </select>
        </div>
        <div class="form-group mt-3">
          <strong class="text-muted">Amount Paid</strong>
          <input type="number" step="any" v-model="amount_paid.value" class="form-control mt-1"
                 v-bind:class="{ 'is-invalid': amount_paid.error }">
        </div>
        <b-button size="sm" class="mt-2" block variant="success" @click="savePayment()"><i
          class='fa fa-fw fa-plus-circle'></i>Submit Payment
        </b-button>
      </div>
    </b-modal>
    <!-- END INVOICE PAYMENT MODAL -->


    <!-- UPDATE GUEST MODAL -->
    <b-modal header-text-variant="light"
             header-bg-variant="primary"
             v-model="update_guest_modal"
             body-class="p-0"
             size="lg"
             no-close-on-backdrop no-close-on-esc
             centered
             hide-footer>
      <template slot="modal-title">
        <h6 class="m-0"><i class='fa fa-fw fa-user'></i>Update Guest Details <u></u></h6>
      </template>
      <guest-details
        :guest="selected_guest"
        :guest_titles="guest_titles"
        :nationalities="nationalities"
        :diet_options="diet_options"
        :gender="gender"
        @guest_details_saved="guestDetailsSaved"
      />
    </b-modal>
    <!-- END UPDATE GUEST MODAL -->

    <!-- UPDATE GUESTS CABIN MODAL -->
    <b-modal header-text-variant="light"
             header-bg-variant="primary"
             v-model="update_booking_details"
             body-class="p-0"
             size="xl"
             no-close-on-backdrop no-close-on-esc
             hide-footer>
      <template slot="modal-title">
        <h6 class="m-0"><i class='fa fa-fw fa-user'></i>Update Guest Details <u></u></h6>
      </template>
      <guests-cabin-details
        :guests="booking_details.guests"
        :add_ons="booking_details.add_ons"
        :itinerary_details="booking_details.itinerary_details"
        :active_invoice="booking_details.active_invoice"
        :total_payment="booking_details.total_payment"
        :booking_id="booking_details.id"
        :selected_menu="selected_menu"
        @update_booking="updateBooking"
      />
    </b-modal>
    <!-- END UPDATE GUESTS CABIN MODAL -->

    <!-- PAYPAL PAYMENT MODAL -->
    <b-modal header-text-variant="light"
             header-bg-variant="primary"
             v-model="paypal_modal"
             body-class="p-0"
             size="lg"
             no-close-on-backdrop no-close-on-esc
             centered
             hide-footer>
      <template slot="modal-title">
        <h6 class="m-0">Process Payment <u></u></h6>
      </template>
      <paypal
        :active_invoice="selected_invoice"
        :booking_details="booking_details"
      />
    </b-modal>
    <!-- END PAYPAL PAYMENT MODAL -->


    <!-- REFUND MODAL -->
    <b-modal
      v-model="refund_modal"
      header-text-variant="light"
      header-bg-variant="primary"
      size="lg"
      no-close-on-backdrop no-close-on-esc
      centered
    >
      <template slot="modal-title">
        <h6 class="m-0">Process Refund <u></u></h6>
      </template>

      <p class="font-weight-bold mb-0">SELECT GUEST/S: (<span class="text-danger">*</span>)</p>
      <b-form-checkbox
        id="checkbox"
        name="checkbox"
        @change="selectAllGuest"
        style="font-size: 13px; cursor: pointer;"
        class="mt-2 text-uppercase text-muted"
      >
        ALL
      </b-form-checkbox>
      <template v-for="(guest, index) in booking_details.guests">
        <b-form-checkbox
          :id="'checkbox'+index"
          v-model="refund.details"
          :name="'checkbox'+index"
          :value="guest"
          :disabled="!checkIfStillAvailable(guest)"
          style="font-size: 13px; cursor: pointer;"
          class="mt-2 text-uppercase text-muted"
          :class="{'pending' : !checkIfStillAvailable(guest)}"
        >
          {{ guest.guest_details.full_name == " " ? 'Guest '+ index : guest.guest_details.full_name}}
          <small class="font-italic">(Amount: &euro; {{ parseFloat(guest.total_amount_due).toLocaleString('en-US',{
            minimumFractionDigits: 2 }) }})
            <br/>
            <span v-if="!checkIfStillAvailable(guest)">Request for refund! (Pending)</span>
          </small>
        </b-form-checkbox>
      </template>

      <b-form-group
        class="text-uppercase font-weight-bold mt-3 mb-0"
        label-for="reason"
      >
        <label slot="label">Reason: (<span class="text-danger">*</span>)</label>
        <b-form-textarea
          :disabled="is_saving_refund"
          id="reason"
          v-model="refund.description"
          placeholder="..."
          rows="5"
        ></b-form-textarea>
      </b-form-group>

      <p class="font-weight-bold mb-0 mt-3">TOTAL REFUND AMOUNT: <span style="font-size:22px;">&euro; {{ total_refund.toLocaleString('en-US',{ minimumFractionDigits: 2 }) }}</span>
      </p>

      <div slot="modal-footer" class="w-100">
        <div class="float-right">
          <b-row>
            <b-col>
              <b-button variant="success" disabled v-if="is_saving_refund" size="sm">
                <template>
                  <b-spinner small type="grow"></b-spinner>
                  Saving Data...
                </template>
              </b-button>
              <b-button
                variant="success"
                class="float-right"
                size="sm"
                v-else
                @click="saveRefund"
              >
                <i class="fa fa-save"></i> Save & Exit
              </b-button>
            </b-col>
          </b-row>
        </div>
      </div>
    </b-modal>
    <!-- END OF REFUND MODAL -->

    <email-reminder-modal
        :open_modal="email_reminder_modal"
        :booking_details="booking_details"
        :selected_email_reminder="selected_email_reminder"
    />

  </div>
</template>


<script>
  import {bus} from '@/main.js';
  import BookingsTable from '@/views/helpers/BookingsTable.vue';
  import GuestDetails from '@/views/helpers/GuestDetails.vue';
  import {Callout} from '@coreui/vue';
  import SwalMixin from '@/views/mixins/Swal.js';
  import Paypal from './Paypal';
  import GuestsCabinDetails from './GuestsCabinDetails';
  import EmailReminderModal from './EmailReminder.vue';

  export default {
    components: {
      BookingsTable,
      Callout,
      GuestDetails,
      GuestsCabinDetails,
      Paypal,
      EmailReminderModal
    },
    mixins: [SwalMixin],
    data() {
      return {
        is_saving_refund: false,
        refund_modal: false,
        refund: {
          id: -1,
          booking_id: -1,
          description: '',
          details: []
        },
        requested_refund: [],

        table_settings: {
          api_url: 'bookings/get_all',
          delete_url: 'test',
          fields: [
            // {key: 'refund', label: 'Refund'},
            {key: 'guest', label: 'Booking Details'},
            {key: 'itinerary', label: 'Itinerary Details'},
            {key: 'itinerary_details.check_in.other_formats.format_1', label: 'Departure Date'},
            {key: 'guest_number', label: 'No. of Guest'},
            {key: 'outstanding_balance', label: 'Outstanding Balance'}
          ]
        },
        booking_details_modal: false,
        invoice_payment_modal: false,
        update_guest_modal: false,
        update_booking_details: false,
        paypal_modal: false,
        selected_invoice: {},
        selected_guest: {},
        booking_details: {},
        invoices: [],
        amount_paid: {
          value: 0,
          error: false
        },
        payment_type: {
          value: '',
          error: false
        },
        booking_id: -1,
        guest_titles: [],
        nationalities: [],
        diet_options: [],
        gender: [],
        payment_types: [],
        selected_menu: 1,

        email_reminder_modal:false,
        email_reminder_set:[
            {
              subject:'Deposit Reminder',
              content:'I hope you’ve been keeping well and are looking forward to your sailing holiday.\n\nThis email is just a friendly reminder that the deposit of your trip is already due. We require customers to settle their deposits within five (5) business days from their initial booking date.  Kindly settle your deposit accordingly to secure you spot on the trip.\n\nWe’ve attached a copy of your invoice for your reference and for you to double check your booking.',
              api:'deposit_reminder'
            },
            {
              subject:'Outstanding Balance Payment Reminder',
              content:'I hope you’ve been keeping well and are looking forward to your sailing holiday.\n\nThis email is just a friendly reminder that the balance of your trip is already due. Kindly settle your deposit accordingly.\n\nWe’ve attached a copy of your invoice for your reference and for you to double check your booking.',
              api:'balance_reminder'
            },
            {
              subject:'Crew List Reminder',
              content:`I hope you’ve been keeping well.

This is an important reminder that you need to fill-in your <strong>“crew list”</strong> information for your upcoming trip on our system.

A <strong>crew list</strong> is term used in the sailing industry referring to the official document that all passenger-carrying vessels are required to submit to the maritime authorities by law.

Hence, we are required to submit the voyage’s crew list in advance to prevent any hold-ups with the authorities and administration staff, so we request that you please log-in to the Med Sailing Holidays booking system using the credentials we have sent you.

Kindly complete all the required fields on your profile for everyone in your group.
Failure to provide us with your crew list information in time will prevent the boat from leaving on time and a worst-case scenario,would result in the boat leaving without you.
Think of it like trying to board a flight, but you haven’t checked in.

For your guidance, here are the details we require you to fill-in for every passenger.  Please make sure you complete all required fields in the system.

Name on passport (as displayed on passport):
Passport number:
Place of birth (Town, City, Country):
Current country and city of residence (City and Country):
Nationality:
Date of birth:
Mobile number: (not required for minors)
WhatsApp: (for the group chat on the trip)
Email: (not required for minors)

You will also need to provide the following information:
Any medical conditions:
Any allergies:
Food preference: Standard meat protein, vegan.

<strong>*IMPORTANT:</strong>
Our crew usually base their shopping of food and provisions on your diet preferences and orders them two (2) weeks before the date of departure.
Failure to complete the diet preference field will mean the crew will prepare the standard meal for the guests who did not specify their preference on the system.
It’s important that you advise us of any dietary requirements or allergies and failure to notify us 2 weeks before your departure date. We cannot be  held accountable if you don’t notify us.

Please let us know if we can help you in the meantime,


Many Thanks,
<strong>The Med Sailing Holidays Team</strong>

www.medsailingholidays.com
www.yogasailingholidays.com
www.pridesailingholidays.com
`,
              api:'crew_list_reminder'
            }
        ],
        selected_email_reminder:{
          booking_id:-1,
          email_to:'',
          subject:'',
          content:'',
          api:''
        }
      }
    },
    watch: {
      refund_modal: {
        handler(val) {
          if (!val) {
            this.refund = {
              id: -1,
              booking_id: -1,
              description: '',
              details: []
            };
          } else {
            this.getRequestedRefund();
          }
        },
        deep: true
      }
    },
    computed: {
      total_refund() {
        return this.refund.details.reduce((previous, current) => {
          return parseFloat(previous) + parseFloat(current.total_amount_due);
        }, 0);
      },
      user_details() {
        return this.$store.getters.userDetails;
      }
    },
    methods: {
      getRequestedRefund() {
        this.axios.get('refund/get', {params: {id: this.refund.booking_id}}).then(response => {
          this.requested_refund = response.data;
        });
      },
      checkIfStillAvailable(guest) {
        let data;
        data = this.requested_refund.find(x => x.booking_cabin_id == guest.id);
        if (typeof data == 'undefined')
          return true;
        return false;

      },
      selectAllGuest(e) {
        if (e == true) {
          let r = this.booking_details.guests.filter(x => {
             let data = this.requested_refund.find(d => d.booking_cabin_id == x.id);
              if (typeof data == 'undefined')
                return true;
              return false;
          });
          // console.log(r);
          this.refund.details = r;
        } else {
          this.refund.details = [];
        }
      },
      saveRefund() {
        if (this.refund.description == "" || this.refund.details.length == 0) {
          this.swalFieldsRequired();
          return;
        }
        this.swalConfirmSubmit((data) => {
          if (data.value) {
            this.is_saving_refund = true;
            this.axios.post("/refund/save", this.refund).then(
              response => {
                this.refund_modal = false;
                this.is_saving_refund = false;
                this.refund = {
                  id: -1,
                  booking_id: -1,
                  description: '',
                  details: []
                };
                this.swalTransactionCompleted();
              }
            )
          }
        });

      },
      openRefundModal() {
        this.refund_modal = true;
        // console.log(this.booking_details);
        let details = JSON.parse(JSON.stringify(this.booking_details));
        this.refund.booking_id = details.id;
      },
      getBookingDetails(booking_id) {
        // alert(1);
        this.axios.get('bookings/get', {params: {booking_id: booking_id}}).then(response => {
          // console.log('nani',response.data.booking);
          // this.list = (response.data.data) ? response.data.data : response.data;
          this.booking_details = response.data.booking;
          this.selected_invoice = response.data.booking.active_invoice;
          this.setUpInvoices(response.data.booking.invoices);
          this.booking_id = booking_id;
          this.guest_titles = response.data.guest_titles;
          this.nationalities = response.data.nationalities;
          this.diet_options = response.data.diet_options;
          this.gender = response.data.genders;
          this.payment_types = response.data.payment_types;
          //console.log(this.invoices);
        }).catch(error => console.log(error));
      },
      setUpInvoices(invoices) {
        this.invoices = [];
        invoices.forEach((val) => {
          let data = JSON.parse(JSON.stringify(val));
          data.show_details = true;
          this.invoices.push(data);
        });
      },
      openPaymentModal() {
        this.invoice_payment_modal = true;
      },
      openPaypalModal() {
        this.paypal_modal = true;
      },
      savePayment() {
        this.swalConfirmSubmit((data) => {
          if (data.value) {
            if (this.amount_paid.value > 0 && this.amount_paid.value != '') {
              let form_data = {};
              form_data.invoice = this.selected_invoice;
              form_data.amount_paid = this.amount_paid.value;
              form_data.payment_type_id = this.payment_type.value;
              this.axios.post('bookings/save_invoice_payment', form_data).then(response => {
                this.invoice_payment_modal = false;
                this.amount_paid.value = 0;
                this.getBookingDetails(this.booking_id);
              }).catch(error => {
                this.swalRequestError();
                this.is_saving = false;
              });
            } else {
              this.amount_paid.error = true;
            }
          }
        });
      },
      updateGuest(guest) {
        this.update_guest_modal = true;
        this.selected_guest = guest;
      },
      guestDetailsSaved() {
        this.update_guest_modal = false;
        this.getBookingDetails(this.booking_id);
      },
      updateBooking() {
        this.update_booking_details = false;
        this.getBookingDetails(this.booking_id);
      },
      updateGuestsCabin(selected_menu) {
        this.update_booking_details = true;
        this.selected_menu = selected_menu;
      },
      printItinerary() {
        let routeData = this.$router.resolve({path: '/print/itinerary/' + this.booking_id});
        window.open(routeData.href, '_blank', "width=800, height=600");
      },
      printReceipt() {
        let routeData = this.$router.resolve({path: '/print/receipt/' + this.booking_id});
        window.open(routeData.href, '_blank', "width=800, height=600");
      },
      emailInvoice() {
        this.axios.post('send_email/invoice', {id: this.booking_id}).then(response => {
          this.swal_transaction_completed_data.text = "Your copy of invoice was sent to " + this.booking_details.user.email;
          this.swalTransactionCompleted();
        }).catch(error => {
          this.swalRequestError();
        });
      },
      emailItinerary() {
        this.axios.post('send_email/itinerary', {id: this.booking_id}).then(response => {
          this.swal_transaction_completed_data.text = "Your copy of itinerary was sent to " + this.booking_details.user.email;
          this.swalTransactionCompleted();
        }).catch(error => {
          this.swalRequestError();
        });
      },
      emailDefaultCredentials() {
        this.swal_confirm_submit_data.title="Send account credentials?";
        this.swal_confirm_submit_data.text="Default account credentials will be sent to "+this.booking_details.user.email;
        this.swal_confirm_submit_data.confirmButtonText="Send";
        this.swal_confirm_submit_data.cancelButtonText="Cancel";
        this.swalConfirmSubmit((data)=>{
            if (data.value) {
              this.axios.post('send_email/default_credentials', {id: this.booking_id}).then(response => {
                this.swal_transaction_completed_data.text = "Email Sent";
                this.swalTransactionCompleted();
              }).catch(error => {
                this.swalRequestError();
              });
            }
        });
      },
      cancelBooking(){
        this.swal_confirm_submit_data.title="Do you want to cancel this Booking?";
        this.swal_confirm_submit_data.text="Booking details will not be available after this action.";
        this.swal_confirm_submit_data.confirmButtonText="Yes";
        this.swal_confirm_submit_data.cancelButtonText="No";
        this.swalConfirmSubmit((data)=>{
            if (data.value) {
                this.axios.post('booking/cancel',{booking_id:this.booking_details.id}).then(response => {
                    // this.invoice_payment_modal=false;
                    // this.amount_paid.value=0;
                    // this.getBookingDetails(this.booking_id);
                    this.swal_transaction_completed_data.text="Booking successfully cancelled.";
                    this.swalTransactionCompleted();
                    this.booking_details_modal=false;
                    this.$refs["displayTable"].getAll();
                }).catch(error => {
                    this.swalRequestError();
                    this.is_saving=false;
                });
            }
        });
      },
      emailReminder(index){
        this.selected_email_reminder = this.email_reminder_set[index];
        this.selected_email_reminder.booking_id = this.booking_details.id;
        this.selected_email_reminder.email_to = this.booking_details.user.email;
        this.email_reminder_modal=true;
      }
    },
    created() {
      //this.getBookingDetails(3);
      //this.setUpInvoices();
      bus.$on('bookingsTableDbClick', (booking_id) => {
        this.booking_details_modal = true;
        this.getBookingDetails(booking_id);
        // this.form_data=JSON.parse(JSON.stringify(data));
        // this.form_modal.modal_status=true;
      });
      bus.$on('formModalClose', ()=>{
          this.email_reminder_modal=false;
      });
      bus.$on('paypalModalClose', ()=>{
          this.paypal_modal=false;
          this.getBookingDetails(this.booking_id);
      });
    }
  }
</script>

<style>
  .pending label::before, .pending label::after {
    top: 9px;
  }
</style>
