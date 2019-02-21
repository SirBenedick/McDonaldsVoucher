module Helper
    def Helper.rateAndExtract(code)
        begin
            #Chrome browser instantiation
            puts "Browser starten"
            options = Selenium::WebDriver::Chrome::Options.new
            # options.add_argument("--headless")
            driver = Selenium::WebDriver.for :chrome, options: options
            #Loading the  URL
            driver.navigate.to Config::URL
            sleep 6
            driver.find_elements(:xpath, "//*[@id=\"slideLi_id1\"]/div/div[3]/div/span/div/div/button/span/img")[0].click
            sleep 4
            #code eingeben
            puts "Code eingabe"
            enter_code = driver.find_elements(:xpath, "//*[@id=\"question_comment_idh\"]")
            enter_code[0].send_keys code
            #should check validation
            continue = driver.find_elements(:xpath, "//*[@id=\"button_next_id0\"]/span")
            continue[0].click
            sleep 2

            #bewerten 4 Steren
            puts "bewerten"
            rateAll = driver.find_elements(:xpath, "//*[@id=\"zone|idw|id11|img\"]")
            rateAll[0].click
            continue[0].click
            sleep 2

            rateEmploye = driver.find_elements(:xpath, "//*[@id=\"zone|id13|id18|img\"]")
            rateEmploye[0].click
            continue[0].click
            sleep 2

            rateSpeed = driver.find_elements(:xpath, "//*[@id=\"zone|id1j|id1o|img\"]")
            rateSpeed[0].click
            continue[0].click
            sleep 2

            rateQuality = driver.find_elements(:xpath, "//*[@id=\"zone|id1u|id1z|img\"]")
            rateQuality[0].click
            continue[0].click
            sleep 2

            rateClean = driver.find_elements(:xpath, "//*[@id=\"zone|id2c|id2h|img\"]")
            rateClean[0].click
            continue[0].click
            sleep 2

            rateCorrect = driver.find_elements(:xpath, "//*[@id=\"answerImage_id2z\"]/img[2]")
            rateCorrect[0].click
            continue[0].click
            sleep 2

            rateSuggest = driver.find_elements(:xpath, "//*[@id=\"zone|id5e|id5n|span\"]/span")
            rateSuggest[0].click
            continue[0].click
            sleep 2

            rateWhatWasntGood = driver.find_elements(:xpath, "//*[@id=\"question_comment_id5u\"]")
            rateWhatWasntGood[0].send_keys "Geht voll klar"
            continue[0].click
            sleep 2

            gender = driver.find_elements(:xpath, "//*[@id=\"answerImage_id5z\"]/img[2]")
            gender[0].click
            continue[0].click
            sleep 1

            age = driver.find_elements(:xpath, "//*[@id=\"answer_id65_3\"]/span")
            age[0].click
            continue[0].click
            sleep 1

            personCount = driver.find_elements(:xpath, "//*[@id=\"answer_id6c_3\"]/div")
            personCount[0].click
            continue[0].click
            sleep 1

            children = driver.find_elements(:xpath, "//*[@id=\"answer_id6m_1\"]/div")
            children[0].click
            continue[0].click
            sleep 2

            howWasIt = driver.find_elements(:xpath, "//*[@id=\"answer_id6u_2\"]/span")
            howWasIt[0].click
            continue[0].click
            sleep 2

            howOft = driver.find_elements(:xpath, "//*[@id=\"answer_id79_3\"]/span")
            howOft[0].click
            continue[0].click
            sleep 2

            done = driver.find_elements(:xpath, "//*[@id=\"surveyFinishButton\"]")
            done[0].click
            sleep 2

            voucher = driver.find_elements(:xpath, "//*[@id=\"getAVoucherForm\"]/input[6]")
            voucher[0].click
            sleep 7

            driver.switch_to.window(driver.window_handles[1])

            code = driver.find_elements(:xpath, "/html/body/div[1]/div[1]/div[1]")
            codeValue = code[0].text
            puts codeValue
            driver.quit
            return codeValue
        rescue
            return "Joar Code war wohl nicht so gültig...."
        ensure
            driver.quit
        end
    end
end
